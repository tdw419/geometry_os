; DESCRIPTION: Creates a cyan rectangular region at (173, 162) spanning 24 by 92 pixels.
; PLAN: r0=173(x), r1=162(y), r2=24(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 162
LDI r2, 24
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
