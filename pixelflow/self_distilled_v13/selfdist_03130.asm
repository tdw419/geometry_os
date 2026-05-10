; DESCRIPTION: Renders a cyan rectangular region spanning 42 by 49 at (382, 13).
; PLAN: r0=382(x), r1=13(y), r2=42(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 13
LDI r2, 42
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
