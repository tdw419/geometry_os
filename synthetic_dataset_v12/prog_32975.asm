; DESCRIPTION: Renders a cyan box of size 39x103 starting at (152, 81).
; PLAN: r0=152(x), r1=81(y), r2=39(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 81
LDI r2, 39
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
