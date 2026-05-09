; DESCRIPTION: Creates a cyan rectangular region at (20, 50) spanning 71 by 86 pixels.
; PLAN: r0=20(x), r1=50(y), r2=71(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 50
LDI r2, 71
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
