; DESCRIPTION: Renders a cyan box of size 82x44 starting at (142, 199).
; PLAN: r0=142(x), r1=199(y), r2=82(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 199
LDI r2, 82
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
