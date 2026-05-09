; DESCRIPTION: Renders a cyan box of size 102x67 starting at (63, 46).
; PLAN: r0=63(x), r1=46(y), r2=102(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 46
LDI r2, 102
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
