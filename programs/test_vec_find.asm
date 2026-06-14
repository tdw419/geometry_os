; VEC_FIND test: near entry 0
; table in r3, query x in r4, query y in r5
LDI r3, 0x5000
LDI r4, 58976
LDI r5, 33982
; VEC_FIND r3, r4, r5 -- nearest neighbor search
VEC_FIND r3, r4, r5
; HALT
HALT
