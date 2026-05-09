; DESCRIPTION: Creates a cyan rectangular region at (214, 125) spanning 42 by 10 pixels.
; PLAN: r0=214(x), r1=125(y), r2=42(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 125
LDI r2, 42
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
