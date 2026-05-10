; DESCRIPTION: Creates a purple filled rectangle of size 92x45 starting at (394, 177).
; PLAN: r0=394(x), r1=177(y), r2=92(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 177
LDI r2, 92
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
