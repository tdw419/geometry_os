; DESCRIPTION: Creates a cyan rectangular region at (407, 59) spanning 95 by 120 pixels.
; PLAN: r0=407(x), r1=59(y), r2=95(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 59
LDI r2, 95
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
