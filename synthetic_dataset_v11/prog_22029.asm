; DESCRIPTION: Places a cyan 63x46 rectangle at position (164, 130).
; PLAN: r0=164(x), r1=130(y), r2=63(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 130
LDI r2, 63
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
