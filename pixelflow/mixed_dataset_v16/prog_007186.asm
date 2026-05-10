; DESCRIPTION: Sets a single cyan pixel at (121, 253).
; PLAN: r0=121(x), r1=253(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 121
LDI r1, 253
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
