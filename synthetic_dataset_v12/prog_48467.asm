; DESCRIPTION: Renders a green box of size 55x82 starting at (61, 86).
; PLAN: r0=61(x), r1=86(y), r2=55(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 86
LDI r2, 55
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
