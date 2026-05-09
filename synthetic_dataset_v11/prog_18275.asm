; DESCRIPTION: Creates a cyan rectangular region at (102, 27) spanning 40 by 50 pixels.
; PLAN: r0=102(x), r1=27(y), r2=40(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 27
LDI r2, 40
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
