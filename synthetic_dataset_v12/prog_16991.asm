; DESCRIPTION: Creates a orange rectangular region at (180, 46) spanning 118 by 120 pixels.
; PLAN: r0=180(x), r1=46(y), r2=118(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 46
LDI r2, 118
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
