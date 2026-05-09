; DESCRIPTION: Places a cyan 63x23 rectangle at position (437, 208).
; PLAN: r0=437(x), r1=208(y), r2=63(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 208
LDI r2, 63
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
