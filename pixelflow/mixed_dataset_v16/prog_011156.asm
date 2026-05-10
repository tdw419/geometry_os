; DESCRIPTION: Renders a cyan box of size 69x103 starting at (441, 79).
; PLAN: r0=441(x), r1=79(y), r2=69(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 79
LDI r2, 69
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
