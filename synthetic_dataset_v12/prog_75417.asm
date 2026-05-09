; DESCRIPTION: Creates a cyan rectangular region at (406, 187) spanning 82 by 42 pixels.
; PLAN: r0=406(x), r1=187(y), r2=82(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 187
LDI r2, 82
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
