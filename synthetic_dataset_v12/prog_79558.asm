; DESCRIPTION: Creates a cyan rectangular region at (180, 147) spanning 24 by 66 pixels.
; PLAN: r0=180(x), r1=147(y), r2=24(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 147
LDI r2, 24
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
