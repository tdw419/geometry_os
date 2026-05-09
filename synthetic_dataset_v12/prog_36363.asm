; DESCRIPTION: Renders a cyan box of size 72x116 starting at (134, 57).
; PLAN: r0=134(x), r1=57(y), r2=72(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 57
LDI r2, 72
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
