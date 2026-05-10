; DESCRIPTION: Creates a orange rectangular region at (317, 127) spanning 65 by 71 pixels.
; PLAN: r0=317(x), r1=127(y), r2=65(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 127
LDI r2, 65
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
