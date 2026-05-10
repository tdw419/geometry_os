; DESCRIPTION: Creates a cyan rectangular region at (174, 186) spanning 48 by 51 pixels.
; PLAN: r0=174(x), r1=186(y), r2=48(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 186
LDI r2, 48
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
