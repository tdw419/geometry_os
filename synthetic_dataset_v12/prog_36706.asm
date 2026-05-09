; DESCRIPTION: Creates a cyan rectangular region at (135, 180) spanning 51 by 55 pixels.
; PLAN: r0=135(x), r1=180(y), r2=51(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 180
LDI r2, 51
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
