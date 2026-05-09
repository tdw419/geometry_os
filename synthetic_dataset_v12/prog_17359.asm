; DESCRIPTION: Renders a cyan box of size 26x22 starting at (198, 188).
; PLAN: r0=198(x), r1=188(y), r2=26(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 188
LDI r2, 26
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
