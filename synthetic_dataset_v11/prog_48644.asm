; DESCRIPTION: Renders a white box of size 32x23 starting at (92, 143).
; PLAN: r0=92(x), r1=143(y), r2=32(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 143
LDI r2, 32
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
