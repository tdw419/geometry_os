; DESCRIPTION: Creates a cyan rectangular region at (450, 71) spanning 10 by 42 pixels.
; PLAN: r0=450(x), r1=71(y), r2=10(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 71
LDI r2, 10
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
