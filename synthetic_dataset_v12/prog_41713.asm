; DESCRIPTION: Creates a white rectangular region at (340, 180) spanning 47 by 70 pixels.
; PLAN: r0=340(x), r1=180(y), r2=47(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 180
LDI r2, 47
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
