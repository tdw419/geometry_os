; DESCRIPTION: Renders a cyan box of size 43x47 starting at (90, 42).
; PLAN: r0=90(x), r1=42(y), r2=43(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 42
LDI r2, 43
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
