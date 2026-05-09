; DESCRIPTION: Renders a purple box of size 39x42 starting at (295, 57).
; PLAN: r0=295(x), r1=57(y), r2=39(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 57
LDI r2, 39
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
