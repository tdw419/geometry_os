; DESCRIPTION: Renders a red box of size 14x16 starting at (186, 231).
; PLAN: r0=186(x), r1=231(y), r2=14(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 231
LDI r2, 14
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
