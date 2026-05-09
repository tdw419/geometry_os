; DESCRIPTION: Renders a cyan box of size 10x103 starting at (441, 143).
; PLAN: r0=441(x), r1=143(y), r2=10(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 143
LDI r2, 10
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
