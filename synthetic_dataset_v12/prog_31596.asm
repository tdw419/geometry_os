; DESCRIPTION: Composite: Renders a red box of size 28x12 starting at (433, 92) then Places a magenta dot at position (353, 92).
; PLAN: r0=433(x), r1=92(y), r2=28(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=353(x), r6=92(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 433
LDI r1, 92
LDI r2, 28
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 92
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
