; DESCRIPTION: Creates a cyan rectangular region at (50, 135) spanning 79 by 92 pixels.
; PLAN: r0=50(x), r1=135(y), r2=79(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 135
LDI r2, 79
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
