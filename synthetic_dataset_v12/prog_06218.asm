; DESCRIPTION: Renders a white box of size 27x64 starting at (389, 143).
; PLAN: r0=389(x), r1=143(y), r2=27(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 143
LDI r2, 27
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
