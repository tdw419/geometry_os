; DESCRIPTION: Creates a yellow rectangular region at (146, 64) spanning 70 by 98 pixels.
; PLAN: r0=146(x), r1=64(y), r2=70(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 64
LDI r2, 70
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
