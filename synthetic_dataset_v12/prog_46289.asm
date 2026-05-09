; DESCRIPTION: Renders a cyan box of size 26x68 starting at (411, 13).
; PLAN: r0=411(x), r1=13(y), r2=26(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 13
LDI r2, 26
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
