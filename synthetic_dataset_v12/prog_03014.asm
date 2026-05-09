; DESCRIPTION: Places a cyan 63x28 rectangle at position (46, 223).
; PLAN: r0=46(x), r1=223(y), r2=63(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 223
LDI r2, 63
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
