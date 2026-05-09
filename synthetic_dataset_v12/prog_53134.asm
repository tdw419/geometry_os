; DESCRIPTION: Renders a cyan box of size 47x97 starting at (103, 63).
; PLAN: r0=103(x), r1=63(y), r2=47(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 63
LDI r2, 47
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
