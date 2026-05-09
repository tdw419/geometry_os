; DESCRIPTION: Places a cyan 92x39 rectangle at position (345, 208).
; PLAN: r0=345(x), r1=208(y), r2=92(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 208
LDI r2, 92
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
