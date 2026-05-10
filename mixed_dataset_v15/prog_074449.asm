; DESCRIPTION: Creates a blue rectangular region at (443, 180) spanning 10 by 17 pixels.
; PLAN: r0=443(x), r1=180(y), r2=10(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 180
LDI r2, 10
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
