; DESCRIPTION: Creates a cyan rectangular region at (155, 120) spanning 50 by 54 pixels.
; PLAN: r0=155(x), r1=120(y), r2=50(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 120
LDI r2, 50
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
