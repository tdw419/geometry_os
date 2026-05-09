; DESCRIPTION: Renders a green box of size 90x68 starting at (301, 178).
; PLAN: r0=301(x), r1=178(y), r2=90(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 178
LDI r2, 90
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
