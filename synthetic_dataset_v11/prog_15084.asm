; DESCRIPTION: Creates a cyan rectangular region at (42, 25) spanning 77 by 70 pixels.
; PLAN: r0=42(x), r1=25(y), r2=77(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 25
LDI r2, 77
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
