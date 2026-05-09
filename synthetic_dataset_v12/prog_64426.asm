; DESCRIPTION: Renders a cyan box of size 68x47 starting at (29, 169).
; PLAN: r0=29(x), r1=169(y), r2=68(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 169
LDI r2, 68
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
