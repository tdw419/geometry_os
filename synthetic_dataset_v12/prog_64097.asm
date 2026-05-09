; DESCRIPTION: Creates a cyan rectangular region at (269, 121) spanning 77 by 50 pixels.
; PLAN: r0=269(x), r1=121(y), r2=77(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 121
LDI r2, 77
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
