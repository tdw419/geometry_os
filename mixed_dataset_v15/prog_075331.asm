; DESCRIPTION: Creates a cyan rectangular region at (154, 161) spanning 40 by 50 pixels.
; PLAN: r0=154(x), r1=161(y), r2=40(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 161
LDI r2, 40
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
