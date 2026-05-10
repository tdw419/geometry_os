; DESCRIPTION: Creates a cyan rectangular region at (428, 5) spanning 42 by 77 pixels.
; PLAN: r0=428(x), r1=5(y), r2=42(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 5
LDI r2, 42
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
