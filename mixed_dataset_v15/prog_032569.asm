; DESCRIPTION: Creates a cyan rectangular region at (214, 12) spanning 80 by 27 pixels.
; PLAN: r0=214(x), r1=12(y), r2=80(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 12
LDI r2, 80
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
