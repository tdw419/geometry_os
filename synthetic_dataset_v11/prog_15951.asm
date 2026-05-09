; DESCRIPTION: Composite: . Then Places a yellow dot at position (82, 112). Then Renders a red box of size 50x56 starting at (25, 92).
; PLAN: r0=82(x), r1=112(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=25(x), r1=92(y), r2=50(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (82, 112).
; PLAN: r0=82(x), r1=112(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 82
LDI r1, 112
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a red box of size 50x56 starting at (25, 92).
; PLAN: r0=25(x), r1=92(y), r2=50(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 92
LDI r2, 50
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
