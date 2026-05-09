; DESCRIPTION: Creates a cyan rectangular region at (143, 57) spanning 120 by 73 pixels.
; PLAN: r0=143(x), r1=57(y), r2=120(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 57
LDI r2, 120
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
