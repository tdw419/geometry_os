; DESCRIPTION: Creates a cyan rectangular region at (120, 183) spanning 48 by 18 pixels.
; PLAN: r0=120(x), r1=183(y), r2=48(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 183
LDI r2, 48
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
