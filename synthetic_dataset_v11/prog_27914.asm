; DESCRIPTION: Renders a green box of size 56x20 starting at (171, 186).
; PLAN: r0=171(x), r1=186(y), r2=56(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 186
LDI r2, 56
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
