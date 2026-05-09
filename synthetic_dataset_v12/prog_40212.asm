; DESCRIPTION: Renders a cyan box of size 79x58 starting at (274, 173).
; PLAN: r0=274(x), r1=173(y), r2=79(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 173
LDI r2, 79
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
