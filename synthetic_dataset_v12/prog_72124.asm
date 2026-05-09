; DESCRIPTION: Renders a black box of size 68x22 starting at (243, 186).
; PLAN: r0=243(x), r1=186(y), r2=68(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 186
LDI r2, 68
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
