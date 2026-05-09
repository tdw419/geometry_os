; DESCRIPTION: Creates a cyan rectangular region at (202, 13) spanning 50 by 20 pixels.
; PLAN: r0=202(x), r1=13(y), r2=50(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 13
LDI r2, 50
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
