; DESCRIPTION: Renders a cyan box of size 28x49 starting at (79, 98).
; PLAN: r0=79(x), r1=98(y), r2=28(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 98
LDI r2, 28
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
