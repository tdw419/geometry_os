; DESCRIPTION: Creates a red rectangular region at (146, 145) spanning 70 by 97 pixels.
; PLAN: r0=146(x), r1=145(y), r2=70(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 145
LDI r2, 70
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
