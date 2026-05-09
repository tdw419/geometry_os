; DESCRIPTION: Renders a cyan box of size 103x116 starting at (273, 37).
; PLAN: r0=273(x), r1=37(y), r2=103(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 37
LDI r2, 103
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
